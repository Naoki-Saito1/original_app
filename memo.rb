
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



 <nav class="navbar navbar-expand-lg navbar-light bg-dark">
  <a class="navbar-brand text-white" href="#">Navbar</a>
  <button class="navbar-toggler bg-white" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link text-white" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>
  </div>
</nav>




================================================







<tbody>
  <div class="container">
    <div class="row">
    <% @portfolios.each do |portfolio| %>
    <div class="col-sm-4">
      <div class="portfolio-wrapper">
        <ul class="portfolio-ul">
         <li><%= portfolio.user.profile.name%></li>
         <li>
         <% if portfolio.portfolio_image.url.present? %>
           <div><%= link_to image_tag(portfolio.portfolio_image.url, style:'width:100px', class: "icon"), portfolio %></div>
         <% else %>
           <%= link_to image_tag(asset_path("no_image.jpg"), class: "icon"), portfolio %>
         <% end %>
          </li>
          <li><%= portfolio.portfolio_title %></li>
          <li><%= portfolio.portfolio_language %></li>
          <% portfolio.frameworks.each do |p| %>
            <% if p.framework_name.present? %>
              <li><%= p.framework_name %></li>
            <% end %>
            <% end %>
          <li><%= portfolio.created_at.strftime("%Y-%m-%d") %></li>
        </ul>
      </div>
    </div>
    <% end %>
    </div>
  </div>

  </tbody>
<br>

<%= link_to 'New Portfolio', new_portfolio_path %>
