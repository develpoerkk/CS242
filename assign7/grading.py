import subprocess
import json
import os
import sys
import argparse
import math
import platform

platform_ext = 'osx' if platform.system() == 'Darwin' else 'linux'
reference_executable = "./bench_solution." + platform_ext
student_executable = "./target/release/bench"

MATCH_REF_GRADE = 0.95
# starting_grade is actually -= (1 - match_ref_grade)
STARTING_GRADE = 0.45

doc = """
Benchmarks student solution against reference solution for assignment 7 for 
collect_par only.
"""

def build_release():
  try:
    print("Building release")
    PIPE = subprocess.PIPE
    exec_res = subprocess.check_output("cargo build --release", stderr=subprocess.STDOUT, shell=True)
    print("Release was built\n")
  except Exception as e:
    print("Python Exception " + str(e))
    exit(-1)

def main(args=None):
  if sys.version_info < (3, 5):
    raise Exception("This script should be run using Python 3.")
  parser = argparse.ArgumentParser(description=doc)
  parser.add_argument('-t', '--test', help="Test name to run against. One of bench.rs TestKind.")
  parser.add_argument('-n', '--items', help="Number of items for benchmarking")
  parser.add_argument('-i', '--iters', help="Number of iterations to run benchmarking to average")
  args = parser.parse_args(args)

  build_release()

  student_score = 0.0
  student_perf_map = {}
  ref_perf_map = {}
  iters = 1 if args.iters is None else int(args.iters)
  for i in range(iters):
    print("Running iteration %d" % i)
    get_times(args.test, args.items, student_perf_map, ref_perf_map)

  for key in student_perf_map:
    student_perf_map[key] /= iters
  for key in ref_perf_map:
    ref_perf_map[key] /= iters

  student_score = do_grading(student_perf_map, ref_perf_map)
  print("Student performance timings:")
  for key in student_perf_map:
    print("   %s: %.4fs" % (key, student_perf_map[key]))
  print("Reference performance timings:")
  for key in ref_perf_map:
    print("   %s: %.4fs" % (key, ref_perf_map[key]))
  print("\nYour score: %d%%" % (math.floor(student_score * 100)))

def grade_test(student_time, ref_time):
  if student_time == 0 or ref_time == 0:
    print("Run grading with a configuration that doesn't result in zero time elapsed!")
    exit(-1)
  if student_time > ref_time:
    student_grade = STARTING_GRADE + (1 - STARTING_GRADE) * (ref_time / student_time) - (1.0 - MATCH_REF_GRADE)
  else:
    student_grade = (MATCH_REF_GRADE) + ((ref_time / student_time) - 1.0)
    if student_grade > 1:
      student_grade = 1
  return student_grade

def do_grading(stud_map, ref_map):
  student_score = 0.0
  with open("test_config.json") as config_f:
      test_config = json.load(config_f)
  print("Grading Breakdown:")
  for test in test_config["tests"]:
    test_name = test["name"]
    test_weight = float(test["weight"])
    if test_name in ref_map:
      student_time = float(stud_map[test_name])
      ref_time = float(ref_map[test_name])
      contribution = test_weight * grade_test(student_time, ref_time)
      print("%s (weight %.3f): %.3f" % (test_name, test_weight, contribution))
      student_score += contribution
  print("")
  return student_score

def get_times(test_name, num_items, stud_map, ref_map):
  if test_name is None:
    test_name = "All"
  ref_exec_name = "%s %s --json" % (reference_executable, test_name)
  stud_exec_name = "%s %s --json" % (student_executable, test_name)
  if num_items is not None:
    num_items = int(num_items)
    ref_exec_name += (" --num_items %d" % (num_items))
    stud_exec_name += (" --num_items %d" % (num_items))

  try:
    PIPE = subprocess.PIPE
    exec_res = subprocess.check_output(stud_exec_name, stderr=subprocess.STDOUT, shell=True)
    exec_sol = subprocess.check_output(ref_exec_name , stderr=subprocess.STDOUT, shell=True)
    res_out = exec_res.decode("utf-8")
    sol_out = exec_sol.decode("utf-8")
    sol = json.loads(sol_out)
    result = json.loads(res_out)
  except Exception as e:
    print("Python Exception " + str(e))
    exit(-1)

  for key in sol:
    if key not in ref_map:
      ref_map[key] = 0.0
    ref_map[key] += float(sol[key])

  for key in result:
    if key not in stud_map:
      stud_map[key] = 0.0
    stud_map[key] += float(result[key])

if __name__ == "__main__":
  main()
