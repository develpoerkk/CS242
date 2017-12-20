open Core

type node = int
type 'a t = {
  nodes : 'a Int.Map.t;
  edges : node list Int.Map.t
}

let make () = { nodes = Int.Map.empty; edges = Int.Map.empty }

let add_node g x =
  let i = Int.Map.length g.nodes in
  ({g with nodes = Int.Map.add g.nodes i x}, i)

let neighbors g i =
  match Int.Map.find g.edges i with
  | Some l -> l
  | None -> []

let add_edge g n1 n2 =
  let l = neighbors g n1 in
  {g with edges = Int.Map.add g.edges n1 (n2 :: l)}

let connected g n1 n2 =
  let rec all_reachable frontier visited =
    let new_frontier =
      Int.Set.fold frontier ~init:Int.Set.empty ~f:(fun new_frontier n ->
        let unvisited_neighbors =
          Int.Set.diff (Int.Set.of_list (neighbors g n)) visited
        in
        Int.Set.union unvisited_neighbors new_frontier)
    in
    let new_visited = Int.Set.union visited frontier in
    if Int.Set.equal new_visited visited then visited
    else all_reachable new_frontier new_visited
  in
  let all = all_reachable (Int.Set.singleton n1) Int.Set.empty in
  Int.Set.mem all n2

let value g n =
  Int.Map.find_exn g.nodes n
