module LineItemsHelper
   def remove_single_item(line_item)
     if line_item.quantity ==1
        # Delete line_item
        return {method: :delete,remote: true}
     else
        # Decrease line_item.quantity by 1
        return {params:{line_item:{quantity: line_item.quantity-1}},method: :put,remote: true}
     end
   end
end
