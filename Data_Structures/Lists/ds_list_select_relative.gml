#define ds_list_select_relative
/// ds_list_select_relative(current,delta,list)
//  GM:S v2.3+ compatible
//
//  Returns a value from a list data structure in a position relative
//  to a given value. If a relative position is beyond exents of list, 
//  the position is clamped to be within range. If current value isn't
//  among the choices, the return value is undefined.
//
//  @param current     value matching a given choice
//  @param delta       relative position of desired choice, integer
//  @param list        list of values to return, if selected
//
//  eg. list == { "Hello", "Doctor", "Name" }
//      ds_list_select_relative("Name", -2, list) == "Hello"
//      ds_list_select_relative("Name", 2, list) == "Doctor"
//
/// GMLscripts.com/license
function ds_list_select_relative(current,delta,list) {
    
    var delta = argument[1];
    var choices = argument[2];
    var size = ds_list_size(choices);
    i = ds_list_find_index(choices, current);
    if (i < 0) return undefined;
    i = clamp (i + delta, 0, size - 1);
    var result = ds_list_find_value(choices, i);
    return result;
}