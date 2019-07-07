<form action="/recipes/<%= @recipe.id %>" method="post">
  <div>
    <label for="name">Recipe name:</label>
    <input type="text" name="name" id="name" value=<%= @recipe.name %>>
  </div>
  <div>
    <label for="ingredients">Recipe ingredients:</label>
    <input type="text" name="ingredients" id="ingredients" value=<%= @recipe.ingredients%>>
  </div>
  <div>
    <label for="cook_time">Recipe Cook Time:</label>
    <input type="text" name="cook_time" id="cook_time" value=<%= @recipe.cook_time%>>
  </div>
  <input name="submit" type="submit" id="submit">
  <input id="hidden" type="hidden" name="_method" value="patch">
