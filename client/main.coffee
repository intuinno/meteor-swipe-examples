
# Initialize the Swiper
@Swiper = new Swipe(['title', 'page1', 'page2', 'page3', 'page4', 'page5'])

Template.main.helpers
  Swiper: -> Swiper
  age: ->
    Session.get('age')

Template.page4.helpers
  age: ->
    Session.get('age')

Template.page5.helpers
    maleselected: -> if Session.get('gender') == 'male' then 'checked' else ''
    femaleselected: -> if Session.get('gender') == 'female' then 'checked' else ''





# If an element controls swiping, make sure to include the `swipe-control` class.
# Then to use the control, use `swipeControl`.
Swiper.click 'page1', '.next', (e,t) ->
  Swiper.moveRight()

Swiper.click 'page2', '.big-right', (e,t) ->
  Swiper.moveRight()

Swiper.click 'page2', '.custom-transition', (e,t) ->
  Swiper.transitionRight 'page5'

Swiper.click 'page5', '.left-to-page4', (e,t) ->
  Swiper.transitionLeft 'page4'

Swiper.click 'page5', '.right-to-page1', (e,t) ->
  Swiper.transitionRight 'page1'

Swiper.click 'page3', '.right-to-page1', (e,t) ->
  Swiper.transitionRight 'page1'

Swiper.click 'page1', '.pop-up', (e,t) ->
  alert 'you cant swipe on this page. only transition left and right and see a pop up.'


Template.main.rendered = ->

  # starting page
  Swiper.setInitialPage('page1')

  # initially, you cant swipe left. but once you go around the loop, page4 drops
  # off. This tests to see that the animation completes and page4 doesnt disappear
  # before it is done animating.

  # once page4 drops off, we have 3 pages. We can scroll through these fast to make
  # sure that the pages wrap around without animating in front of us.



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

Template.main.events({
  "submit .new-age": (event) ->
      # Prevent default browser form submit
      event.preventDefault();
 
      # Get value from form element
      text = event.target.text.value;
 
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




    
})
