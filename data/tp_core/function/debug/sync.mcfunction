# Mirrors the global setting tp_core:debug into the #debug flag that every debug call site checks. Runs on load and on every setting change.
execute store result score #debug tp_core.tmp run function tp_core:setting/get {id:"tp_core:debug"}
