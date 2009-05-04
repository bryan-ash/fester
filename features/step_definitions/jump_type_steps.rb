Given /^there is a jump type named "(.*)"$/ do |jump_type|
  JumpType.create! :name => jump_type
end
