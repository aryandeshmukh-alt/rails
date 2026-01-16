# Blog Application – Ruby on Rails (Assignment 1)

## Overview

This project is a simple blog application built using Ruby on Rails.  
It demonstrates core Rails concepts such as MVC architecture, ActiveRecord associations, routing, validations, and basic UI rendering using ERB.

The application supports creating blogs, managing published and draft states, adding comments, and interacting with blogs through likes.

* * *

## Why This Project Was Built

This project was created as part of a Rails fundamentals assignment to:

*   Understand how Rails scaffolding works  
      
    
*   Learn how models, controllers, views, and routes interact  
      
    
*   Practice database migrations and associations  
      
    
*   Explore Rails conventions instead of manual configuration  
      
    
*   Build confidence working with a real Rails codebase  
      
    

* * *

## Features Implemented

### Blogs

*   Create, edit, view, and delete blogs  
      
    
*   Blogs have two states: Published & Unpublished  
      

*   Only published blogs: Can be liked & Can receive comments


*   Separate listing for:  Published & Unpublished blogs
      

### Likes

*   Blogs have a likes\_count column with default value 0  
      
    
*   Like button increases the count  


### Comments

*   Comments belong to a blog  
      
    
*   Comments can only be added to published blogs  
      
    
*   Validation ensures comments cannot exist for draft blogs  
      
    
*   Comments are displayed under the respective blog  
      
    

### UI Improvements

*   Clean card-based layout for blogs  
      
    
*   Visual separation between title and body  
      
    
*   Status badge for Published / Draft  
      
    
*   Like button and like count aligned properly  
      
    
*   Improved spacing and readability across pages  
      
    
*   Improved form UI for creating and editing blogs  
      
    

* * *

## Concepts Covered

*   Rails MVC architecture  
      
    
*   ActiveRecord models and associations  
      
    
*   Database migrations  
      
    
*   Validations and custom validation methods  
      
    
*   RESTful routes  
      
    
*   Partials (\_blog.html.erb)  
      
    
*   Rails helpers (form\_with, button\_to, link\_to)  
      
    
*   Turbo Streams for partial updates  
      
    
*   Seeds for database setup  
      
    
*   Git-based incremental commits  
      
    

* * *

## Project Structure (Important Files)

app/

 ├── controllers/

 │    └── blogs\_controller.rb

 ├── models/

 │    ├── blog.rb

 │    └── comment.rb

 ├── views/

 │    ├── blogs/

 │    │    ├── index.html.erb

 │    │    ├── \_blog.html.erb

 │    │    ├── show.html.erb

 │    │    └── \_form.html.erb

 │    └── comments/

db/

 ├── migrate/

 ├── seeds.rb

 └── schema.rb

  

* * *

## How the Flow Works (Step-by-Step)

1.  User visits /blogs  
      
    
2.  Blogs are loaded from the database  
      
    
3.  Each blog is rendered using a partial  
      
    
4.  Draft and published states are visually distinguished  
      
    
5.  Published blogs allow:  
      
    

*   Likes  
      
    
*   Comments  
      
    

7.  Draft blogs allow:  
      
    

*   Publish action  
      
    

9.  Likes update without redirect  
      
    
10.  Comments are listed under the blog  
      
    

* * *

## Database Seeds

      
Run:

```
rails db:seed
```

Verify:

```
rails console
```

Blog.count

Comment.count

  

* * *

## How to Run the Project

```
bundle install

rails db:create

rails db:migrate

rails db:seed

rails server
```
  

Open:
```
http://localhost:3000
```
  

* * *

## What Was Asked vs What Was Done

### Asked in Assignment

*   Blog CRUD  
      
    
*   Comments  
      
    
*   Published vs draft logic  
      
    
*   Seeds  
      
    
*   Basic UI  
      
    

### Additional Enhancements

*   Like feature with counter  
      
    
*   Better UI layout  
      
    
*   Separate listing pages  
      
    
*   Turbo-based updates  
      
    
*   Cleaner validations  
      
    
*   Structured partial-based rendering  
      
    

* * *
