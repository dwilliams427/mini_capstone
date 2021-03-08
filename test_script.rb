require "http"

response = HTTP.get("http://127.0.0.1:3000/api/products/", :params => { :id => 5 })

pp response.parse
