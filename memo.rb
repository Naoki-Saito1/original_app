
<%= link_to 'Back', profiles_path %>

<li><%= link_to 'Show', portfolio %></li>
<li><%= link_to 'Edit', edit_portfolio_path(portfolio) %></li>
          <li><%= link_to 'Destroy', portfolio, method: :delete, data: { confirm: 'Are you sure?' } %></li>

          .row{
            margin-top: 5rem;
          }
          .col-2{
          
            
          }
          .side-bar{
            position: fixed;
            top: 5rem;
          }
          .nav{
            padding-left: 200px;
          }




          <div class="nav">
 <% if user_signed_in? %>
   <%= link_to "ログアウト", destroy_user_session_path, method: :delete %>
 <% else %>
   <%= link_to "新規登録", new_user_registration_path %>
   <%= link_to "ログイン", new_user_session_path %>
 <% end %>
 </div>
