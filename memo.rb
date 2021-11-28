
<%= link_to 'Back', profiles_path %>

<li><%= link_to 'Show', portfolio %></li>
<li><%= link_to 'Edit', edit_portfolio_path(portfolio) %></li>
          <li><%= link_to 'Destroy', portfolio, method: :delete, data: { confirm: 'Are you sure?' } %></li>