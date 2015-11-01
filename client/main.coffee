
# Initialize the Swiper
@Swiper = new Swipe(['title', 'page1', 'page2', 'page3', 'page4', 'page5','page6'])

Template.main.helpers
  Swiper: -> Swiper
 
Template.page4.helpers
  age: ->
    Session.get('age')

Template.page5.helpers
    malechecked: -> if Session.get('gender') == 'male' then 'checked' else ''
    femalechecked: -> if Session.get('gender') == 'female' then 'checked' else ''
    maleactive: -> if Session.get('gender') == 'male' then 'active' else ''
    femaleactive: -> if Session.get('gender') == 'female' then 'active' else ''

Template.page6.helpers
  height: ->
    Session.get('height')




# If an element controls swiping, make sure to include the `swipe-control` class.
# Then to use the control, use `swipeControl`.

Template.main.rendered = ->

  # starting page
  Swiper.setInitialPage('page1')


  Tracker.autorun ->
    if Swiper.pageIs('page1')
      Router.go 'page1'
      Swiper.leftRight(null, 'page2')

  Tracker.autorun ->
    if Swiper.pageIs('page2')
      Router.go 'page2'
      Swiper.leftRight('page1', 'page3')

  Tracker.autorun ->
    if Swiper.pageIs('page3')
      Router.go 'page3'
      Swiper.leftRight('page2', 'page4')

  Tracker.autorun ->
    if Swiper.pageIs('page4')
      Router.go 'page4'
      Swiper.leftRight('page3', 'page5')

  Tracker.autorun ->
    if Swiper.pageIs('page5')
      Router.go 'page5'
      Swiper.leftRight('page4', 'page6')


  Tracker.autorun ->
    if Swiper.pageIs('page6')
      Router.go 'page6'
      Swiper.leftRight('page5', 'page7')

Template.main.events({
  "submit .new-age": (event) ->
      # Prevent default browser form submit
      event.preventDefault();
 
      # Get value from form element
      text = event.target.ageInput.value;
 
      console.log(text);
      Session.setPersistent('age', text);

  "change #gendermale": (event) ->
      # Prevent default browser form submit
      event.preventDefault();
 
      # Get value from form element
      console.log("male selected")
      Session.setPersistent('gender', 'male')

  "change #genderfemale": (event) ->
      # Prevent default browser form submit
      event.preventDefault();
 
      # Get value from form element
      console.log("female selected")
      Session.setPersistent('gender', 'female')

  "submit .new-height": (event) ->
      # Prevent default browser form submit
      event.preventDefault();
 
      # Get value from form element
      text = event.target.heightInput.value;
 
      console.log(text);
      Session.setPersistent('height', text);


    
})
