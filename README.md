# My app

![Domain Model](erd.png?raw=true "Domain Model")

```
rails generate devise user
rails generate scaffold experiment primary:references user:references title:string
rails generate scaffold example experiment:references content:text embedding:integer
```