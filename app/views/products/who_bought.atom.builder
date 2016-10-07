atom_feed do |feed|
  feed.title "Who bought #{@product.title}"

  feed.updated @latest_order.try(:updated_at)

  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{order.address}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Product'
            xhtml.th 'Quantity'
            xhtml.th 'Total Price'
          end
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.product.title
              xhtml.td item.quantity
              xhtml.td number_to_currency item.total_price
            end
          end
          xhtml.tr do
            xhtml.th 'total', colspan: 2
            xhtml.th number_to_currency \
            order.line_items.map(&:total_price).sum
          end
        end
        xhtml.p "Paid by #{order.pay_type}"
      end
      entry.author do |author|
        author.name order.name
        author.email order.email
      end
    end
  end
end

# A sample xhtml is listed below: 

# <?xml version="1.0" encoding="UTF-8"?>
# <feed xml:lang="en-US" xmlns="http://www.w3.org/2005/Atom">
#   <id>tag:localhost,2005:/products/4/who_bought</id>
#   <link rel="alternate" type="text/html" href="http://localhost:3000"/>
#   <link rel="self" type="application/atom+xml" href="http://localhost:3000/products/4/who_bought.atom"/>
#   <title>Who bought CoffeeScript</title>
#   <updated>2016-10-07T09:38:25Z</updated>
#   <entry>
#     <id>tag:localhost,2005:Order/1</id>
#     <published>2016-10-07T04:38:14Z</published>
#     <updated>2016-10-07T04:38:14Z</updated>
#     <link rel="alternate" type="text/html" href="http://localhost:3000/orders/1"/>
#     <title>Order 1</title>
#     <summary type="xhtml">
#       <div xmlns="http://www.w3.org/1999/xhtml">
#         <p>Shipped to Habourview Horizon.</p>
#         <table>
#           <tr>
#             <th>Product</th>
#             <th>Quantity</th>
#             <th>Total Price</th>
#           </tr>
#           <tr>
#             <td>CoffeeScript</td>
#             <td>2</td>
#             <td>$26.00</td>
#           </tr>
#           <tr>
#             <td>Programming Ruby 1.9 &amp; 2.0</td>
#             <td>2</td>
#             <td>$99.90</td>
#           </tr>
#           <tr>
#             <td>Rails Test Prescriptions</td>
#             <td>2</td>
#             <td>$92.00</td>
#           </tr>
#           <tr>
#             <th colspan="2">total</th>
#             <th>$217.90</th>
#           </tr>
#         </table>
#         <p>Paid by Check</p>
#       </div>
#     </summary>
#     <author>
#       <name>Simon Sun</name>
#       <email>simonsun1217@gmail.com</email>
#     </author>
#   </entry>
#   <entry>
#     <id>tag:localhost,2005:Order/2</id>
#     <published>2016-10-07T09:38:25Z</published>
#     <updated>2016-10-07T09:38:25Z</updated>
#     <link rel="alternate" type="text/html" href="http://localhost:3000/orders/2"/>
#     <title>Order 2</title>
#     <summary type="xhtml">
#       <div xmlns="http://www.w3.org/1999/xhtml">
#         <p>Shipped to XiaMen</p>
#         <table>
#           <tr>
#             <th>Product</th>
#             <th>Quantity</th>
#             <th>Total Price</th>
#           </tr>
#           <tr>
#             <td>CoffeeScript</td>
#             <td>1</td>
#             <td>$13.00</td>
#           </tr>
#           <tr>
#             <td>Programming Ruby 1.9 &amp; 2.0</td>
#             <td>1</td>
#             <td>$49.95</td>
#           </tr>
#           <tr>
#             <td>Rails Test Prescriptions</td>
#             <td>1</td>
#             <td>$46.00</td>
#           </tr>
#           <tr>
#             <th colspan="2">total</th>
#             <th>$108.95</th>
#           </tr>
#         </table>
#         <p>Paid by Purchase Order</p>
#       </div>
#     </summary>
#     <author>
#       <name>Leoest</name>
#       <email>leoest@example.com</email>
#     </author>
#   </entry>
# </feed>
