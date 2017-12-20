local util = require "sat_util"

-- print a table
function print_table(tbl)
	if tbl == nil then
		print("nil")
	else
		for k, v in pairs(tbl) do
			print(tostring(k)..": "..tostring(v))
		end
	end
end

-- return the size of a table
function size(tbl) 
	if tbl == nil then
		print("size nil")
		return 0
	end
	local cnt = 0
	for k, v in pairs(tbl) do
		cnt = cnt + 1
	end
	return cnt
end

--[[ This function takes in a list of atoms (variables) and a boolean expression
in conjunctive normal form. It should return a mapping from atom to booleans that
represents an assignment which satisfies the expression. If no assignments exist,
return nil. ]]--
function satisfiable(atoms, cnf)
	local function helper(assignment, clauses)
	-- corner case
	if atoms == nil then return nil	end
	local atoms_size = size(atoms)
	if atoms_size == 0 then return nil end
	if cnf == nil then return nil end

	-- general case
	local cnf_size = size(cnf)

    -- Your code goes here.
    -- You may find util.deep_copy useful.
	
	local cnf_size = size(clauses)
	local assignment = helper_helper(assignment, clauses, cnf_size, 1) 
	-- supplement atoms that never appears
	if assignment == nil then return nil end
	for k, v in pairs(atoms) do
		if assignment[v] == nil then
			assignment[v] = true
		end
	end

	-- less atoms, more cnf
    local assn_size = size(assignment)
	if atoms_size < assn_size then
		return nil
	end
	return assignment
  end
  return helper({}, cnf)
end

-- generate a feasible assignment
function helper_helper(assignment, clauses, cnf_size, index)
	-- base case: go to the end
	if index >= cnf_size + 1 then
		return assignment
	end

	-- recursive case: not the end
	local curr_clause = clauses[index]
	local curr_assn = assn_gen(curr_clause)
	for k, v in pairs(curr_assn) do		-- curr_assn is a list of tables
		local prev_assn = util.deep_copy(assignment)
		local collision = false
		for kk, vv in pairs(v) do		-- v is a table {a: true} 
			if prev_assn[kk] == nil then
				prev_assn[kk] = vv
			elseif prev_assn[kk] ~= vv then
				collision = true
				break
			end
		end
		
		if collision then 
			goto continue				
		else
			return helper_helper(prev_assn, clauses, cnf_size, index + 1)
		end
		::continue::
	end

	return nil
end
	
-- generate all possible assignments for this clause
function assn_gen(clause) 
	local ans = {}
	local impossible = {}

	local clause_size = size(clause)
	for k, v in pairs(clause) do
		local letter = v[1]
		local booler = v[2]
		if impossible[letter] == nil then
			impossible[letter] = not booler
		elseif impossible[letter] ~= booler then
			impossible[letter] = nil
		end
	end
    assn_gen_helper(clause, clause_size, impossible, {}, ans, 1)
	return ans
end

-- find 1 possible assignment and then add it into list
function assn_gen_helper(clause, clause_size, impossible, curr, ans, index)
	-- base case: loop to the end
    if index >= clause_size + 1 then
		if util.deep_equal(curr, impossible, false) == false then 
			table.insert(ans, curr)
		end
		return
	end
	-- recursive case: not to the end
	local literal = clause[index]
	local letter = literal[1]
	local booler = literal[2]
	if curr[letter] == nil then
		local true_type = util.deep_copy(curr)
		local false_type = util.deep_copy(curr)
		true_type[letter] = true
		false_type[letter] = false
		assn_gen_helper(clause, clause_size, impossible, true_type, ans, index + 1)
		assn_gen_helper(clause, clause_size, impossible, false_type, ans, index + 1)
	elseif curr[letter] ~= booler then
		local copy_type = util.deep_copy(curr)
		copy_type[letter] = nil
		assn_gen_helper(clause, clause_size, impossible, copy_type, ans, index + 1)
	end
end



-- generate a feasible assignment
function helper_helper_2(tbl_of_tbl, assignment, clauses, cnf_size, index)
	-- base case: go to the end
	if index >= cnf_size + 1 then
		table.insert(tbl_of_tbl, assignment)
		return
		-- return assignment
	end

	-- recursive case: not the end
	local curr_clause = clauses[index]
	local curr_assn = assn_gen(curr_clause)
	for k, v in pairs(curr_assn) do		-- curr_assn is a list of tables
		local prev_assn = util.deep_copy(assignment)
		local collision = false
		for kk, vv in pairs(v) do		-- v is a table {a: true} 
			if prev_assn[kk] == nil then
				prev_assn[kk] = vv
			elseif prev_assn[kk] ~= vv then
				collision = true
				break
			end
		end
		
		if collision then 
			goto continue				
		else
			-- coroutine.yield(helper_helper_2(prev_assn, clauses, cnf_size, index + 1))
			helper_helper_2(tbl_of_tbl, prev_assn, clauses, cnf_size, index + 1)
		end
		::continue::
	end

	-- return nil
end

--[[ The function above only returns one solution. This function should return
an iterator which calculates, on demand, all of the solutions. ]]--
function satisfiable_gen(atoms, cnf)
	-- local function helper (assignment, clauses)
	--   -- Your code goes here.
	--   -- You may find util.deep_copy useful.
	-- end

	local function helper(assignment, clauses)
		-- Your code goes here.
		-- You may find util.deep_copy useful.

		-- corner case
		if atoms == nil then return nil	end
		local atoms_size = size(atoms)
		if atoms_size == 0 then return nil end
		if cnf == nil then return nil end

		-- general case
		local cnf_size = size(cnf)
		local tbl_of_tbl = {}
		helper_helper_2 (tbl_of_tbl, assignment, clauses, cnf_size, 1) 
		-- supplement atoms that never appears
		local extra = {}
		for idx, ele in pairs(tbl_of_tbl) do	-- ele is a feasible table
			for k, v in pairs(atoms) do
				if ele[v] == nil then
					table.insert(extra, v)
				end
			end

			-- less atoms, more cnf
			local ele_size = size(ele)
			if atoms_size < ele_size then
				tbl_of_tbl[idx] = nil	
			end
		end

		local tmp = {}
		for _, v in pairs(extra) do
			for __, vv in pairs(tbl_of_tbl) do
				local cp_1 = util.deep_copy(vv)
				cp_1[v] = true
				table.insert(tmp, cp_1)
				local cp_2 = util.deep_copy(vv)
				cp_2[v] = false
				table.insert(tmp, cp_2)
			end
			tbl_of_tbl = tmp
			tmp = {}
		end

		for _, ele in pairs(tbl_of_tbl) do
			coroutine.yield(ele)
		end

	end

	local solutions = coroutine.wrap(function ()
		helper({}, cnf)
	end)

	--[[ We've provided a wrapper which removes duplicate solutions so that
	your solver doesn't need to check for duplicates before emitting a result. ]]--
	return util.iter_dedup(solutions)
end

-- self test here
test_atom = {"a", "b", "c"}
test_cnf = {{{"a", true}, {"b", false}, {"c", true}}}
res = satisfiable(test_atom, test_cnf)

-- official test
util.run_basic_tests()
