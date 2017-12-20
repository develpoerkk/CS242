open Core

type 'a t
type node

(* Creates an empty graph. *)
val make : unit -> 'a t

(* Adds a single node to the graph and returns the updated graph
 * and a handle to the node. *)
val add_node : 'a t -> 'a -> 'a t * node

(* Adds a directed edge between two nodes and returns the updated graph. *)
val add_edge : 'a t -> node -> node -> 'a t

(* Gets the value associated with a particular node. *)
val value : 'a t -> node -> 'a

(* Returns all the out-neighbors of the input node. *)
val neighbors : 'a t -> node -> node list

(* Returns true if there is there is a (directed) path between the two
 * nodes. Does not have to be symmetric. *)
val connected : 'a t -> node -> node -> bool
