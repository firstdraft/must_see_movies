# Must See Movies: Phase 3

In this project, we'll practice leveraging foreign keys to build rich relationships between our models.

## Step 1: Remove foreign keys from views

Even though we decided that ID numbers were the best way to tie models together, we definitely don't want users to have to see them anywhere. Right now, for example, on the movies#index and movies#show pages, we are displaying raw director ID numbers instead of something more helpful, like the director's name.

Go through all views and replace raw foreign keys with something more descriptive.

### Tests

 - movies#index page should not display director foreign keys
 - movies#show page should not display director foreign keys
 - roles#index page should not display movie foreign keys
 - roles#show page should not display movie foreign keys
 - roles#index page should not display actor foreign keys
 - roles#show page should not display actor foreign keys

## Step 2: Replace text field inputs for foreign keys with dropdowns

When users add new movies, they currently have to type the director's ID into a text field. (Why will it not work to type in the director's name?) This isn't a very good experience.

Let's provide them with a dropdown box instead. Display the director's name in the dropdown box, but when they submit the form, make sure that it is still the director's ID number that goes through in to the `params` hash.

Repeat for any form that involves a foreign key.

### Tests

 - movies#new form should have a select tag with options for directors
 - movies#edit form should have a select tag with options for directors
 - roles#new form should have a select tag with options for movies
 - roles#edit form should have a select tag with options for movies
 - roles#new form should have a select tag with options for actors
 - roles#edit form should have a select tag with options for actors

## Step 3: Display one-to-many collections

Description of step here.

### Tests

 - directors#show page should show filmography (movie titles).
 - movies#show page should show list of roles (character names).
 - actors#show page should show list of roles (character names).

## Step 4: Display many-to-many collections

Description of step here.

 - movies#show page should show cast (actor names).
 - actors#show page should show filmography (movie titles).
