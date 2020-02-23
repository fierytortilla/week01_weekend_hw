require('pry-byebug')

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash_amount)
  pet_shop[:admin][:total_cash]= pet_shop[:admin][:total_cash] + cash_amount
  return nil
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_pets)
  pet_shop[:admin][:pets_sold]= pet_shop[:admin][:pets_sold]+number_pets
  return nil
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop, breed)
  all_pets_by_breed= pet_shop[:pets].select{|pet| pet[:breed]==breed}
  return all_pets_by_breed
end

def find_pet_by_name(pet_shop, pet_name)
  pet_with_name= pet_shop[:pets].find{|pet| pet[:name]== pet_name}
  if pet_with_name != nil
    return pet_with_name
  else
    return nil
  end
end

def remove_pet_by_name(pet_shop, pet_name)
  pet_to_be_removed= pet_shop[:pets].find{|pet| pet[:name]== pet_name}
  pet_shop[:pets].delete(pet_to_be_removed)
  return nil
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
  return nil
end

def customer_cash(customer)
  customer_cash= customer[:cash]
  return customer_cash
end

def remove_customer_cash(customer, cash_amount)
  customer[:cash]= customer[:cash] - cash_amount
  return nil
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
  return nil
end

def customer_can_afford_pet(customer, new_pet)
  customer_cash= customer[:cash]
  new_pet_price= new_pet[:price]
  if customer_cash>= new_pet_price
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer[:cash] >= pet[:price]
    remove_pet_by_name(pet_shop, pet[:name])
    add_or_remove_cash(pet_shop, pet[:price])
    remove_customer_cash(customer, pet[:price])
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
  elsif pet== nil || customer[:cash] < pet[:price]
  end
  return nil
end
