(* test_bucket.ml *)

(* Load the ClassBoundary module from the submodule *)
let CB = ClassBoundary

let intervals = [
  CB.{ lower = 0.0; upper = 10.0; valid = Obj.magic () };
  CB.{ lower = 10.0; upper = 20.0; valid = Obj.magic () };
  CB.{ lower = 20.0; upper = 30.0; valid = Obj.magic () };
]

let classify x =
  List.find_opt (fun cb -> x >= cb.lower && x < cb.upper) intervals

let test_values = [9.999; 10.0; 10.001; 19.999; 20.0; 20.001]

let () =
  List.iter (fun x ->
    let bucket = match classify x with
      | Some cb -> Printf.sprintf "[%.3f, %.3f)" cb.lower cb.upper
      | None -> "None"
    in
    Printf.printf "x = %.3f → %s\n" x bucket
  ) test_values
