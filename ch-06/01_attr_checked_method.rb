# Create a fake method called attr_checked similar to attr_accessor which should take the name of the attribute
# as well as a block which will be used for validation. If one assigns a value tot he attribute and the block
# does not return true for that value then it should return a runtime exception. In addition, a class should gain
# access to attr_checked only when it includes a checkedAttributes module.


# STEPS

# 1. Write a Kernel Method (Kernel Method) named add_checked_attribute using eval to add a super-simple validated attribute to a class.                   
# 2. Refactor add_checked_attribute to remove eval.                               
# 3. Validate attributes through a block.                      
# 4. Change add_checked_attribute to a Class Macro (Class Macro) named attr_checked that’s available to all classes.                                                   
# 5. Write a module adding attr_checked to selected classes through a hook.

