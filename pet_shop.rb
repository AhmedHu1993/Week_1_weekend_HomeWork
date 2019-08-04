def pet_shop_name(pet_shop_hash)
  return pet_shop_hash[:name]
end


def total_cash(pet_shop_hash)
  return pet_shop_hash[:admin][:total_cash]
end


def add_or_remove_cash(pet_shop_hash, amount)
pet_shop_hash[:admin][:total_cash] += amount
end


def pets_sold(pet_shop_hash)
  return pet_shop_hash[:admin][:pets_sold]
end


def increase_pets_sold(pet_shop_hash, amount)
  pet_shop_hash[:admin][:pets_sold] += amount
end


def stock_count(pet_shop_hash)
  return pet_shop_hash[:pets].count
end


def pets_by_breed(pet_shop_hash, search_tag_in_breed)
pets_in_common = []
  for pet in pet_shop_hash[:pets]
      if pet[:breed] == search_tag_in_breed
        pets_in_common.push(pet)
      end
    end
    return pets_in_common
end


def find_pet_by_name(pet_shop_hash, pet_name)
  for pet in pet_shop_hash[:pets]
    if pet[:name] == pet_name
      return pet
    end
  end
  return nil
end


def remove_pet_by_name(pet_shop_hash, pet_name)
  for pet in pet_shop_hash[:pets]
      if pet[:name] == pet_name
        pet_shop_hash[:pets].delete(pet)
      end
  end
end


def add_pet_to_stock(pet_shop_hash, new_pet_hash)
    return pet_shop_hash[:pets].push(new_pet_hash)
end


def customer_cash(customer)
    return customer[:cash]
end


def remove_customer_cash(customer, amount)
     customer[:cash] -= amount
end


def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end


#THE OPTIONAL FUNCTIONS
def customer_can_afford_pet(customer, new_pet)
  customer[:cash] >= new_pet[:price]? true : false
end


def sell_pet_to_customer(pet_shop_hash, sold_pet, customer)
  if sold_pet != nil && customer[:cash] >= sold_pet[:price]
    customer[:pets].push(sold_pet)
    pet_shop_hash[:admin][:pets_sold] += 1
    customer[:cash] -= sold_pet[:price]
    pet_shop_hash[:admin][:total_cash] += sold_pet[:price]
  end
end
