open Belt.List
open Node

let example_input = `199
200
208
210
200
207
240
269
260
263`

let ex1_input = Fs.readFileAsUtf8Sync("Day1.input");

@ocaml.doc("Reducer. Accumulator increases each time an element is larger than the last")
let count_larger = ((counter, opt_last), next) => {
    switch opt_last {
    | Some(last) => {
        if next > last {
            ((counter+1), Some(next))
        } else {
            (counter, Some(next))
        }
    }
    | None => (counter, Some(next))
    }
}

let depth_increases = (input) => String.split_on_char('\n', input)
    -> keepMap (a => Belt.Int.fromString(a))
    -> reduce((0, None), (count_larger))
    -> ((acc, _)) => (acc)

let example_solution =
    depth_increases(example_input)
        -> Belt.Int.toString

let ex1_solution =
    depth_increases(ex1_input)
        -> Belt.Int.toString

Js.log(`Depth increases example: ${example_solution}`)
Js.log(`Depth increases ex1: ${ex1_solution}`)
// Js.log(`Depth increases example: ${example_solution}`)