
# Initialize the Swiper
@Swiper = new Swipe(['title', 'page1', 'page2', 'page3', 'page4', 'page5','page6','page7', 'smoking', 'alcohol', 'activity', 'education' ,'stress', 'diabetes1', 'diabetes2', 'heart', 'stroke' , 'firstname', 'result', 'change', 'phone', 'refer', 'thankyou'])

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

Template.page7.helpers
  weight: ->
    Session.get('weight')

Template.result.helpers
  firstname: ->
    Session.get('firstname')

Template.firstname.helpers
  firstname: ->
    Session.get('firstname')


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

  Tracker.autorun ->
    if Swiper.pageIs('page7')
      Router.go 'page7'
      Swiper.leftRight('page6', 'smoking')


  Tracker.autorun ->
    if Swiper.pageIs('smoking')
      Router.go 'smoking'
      Swiper.leftRight('page7', 'alcohol')

  Tracker.autorun ->
    if Swiper.pageIs('alcohol')
      Router.go 'alcohol'
      Swiper.leftRight('smoking', 'activity')


  Tracker.autorun ->
    if Swiper.pageIs('activity')
      Router.go 'activity'
      Swiper.leftRight('alcohol', 'education')

  Tracker.autorun ->
    if Swiper.pageIs('education')
      Router.go 'education'
      Swiper.leftRight('activity', 'stress')

  Tracker.autorun ->
    if Swiper.pageIs('stress')
      Router.go 'stress'
      Swiper.leftRight('activity', 'diabetes1')

  Tracker.autorun ->
    if Swiper.pageIs('diabetes1')
      Router.go 'diabetes1'
      Swiper.leftRight('stress', 'diabetes2')

  Tracker.autorun ->
    if Swiper.pageIs('diabetes2')
      Router.go 'diabetes2'
      Swiper.leftRight('diabetes1', 'heart')

  Tracker.autorun ->
    if Swiper.pageIs('heart')
      Router.go 'heart'
      Swiper.leftRight('diabetes2', 'stroke')

  Tracker.autorun ->
    if Swiper.pageIs('stroke')
      Router.go 'stroke'
      Swiper.leftRight('heart', 'firstname')

  Tracker.autorun ->
    if Swiper.pageIs('firstname')
      Router.go 'firstname'
      Swiper.leftRight('stroke', 'result')

  Tracker.autorun ->
    if Swiper.pageIs('result')
      Router.go 'result'
      Swiper.leftRight('firstname', 'change')

  Tracker.autorun ->
    if Swiper.pageIs('change')
      Router.go 'change'
      Swiper.leftRight('result', 'phone')

  Tracker.autorun ->
    if Swiper.pageIs('phone')
      Router.go 'phone'
      Swiper.leftRight('change', 'refer')

  Tracker.autorun ->
    if Swiper.pageIs('refer')
      Router.go 'refer'
      Swiper.leftRight('change', 'thankyou')

  Tracker.autorun ->
    if Swiper.pageIs('thankyou')
      Router.go 'thankyou'
      Swiper.leftRight('refer', null)



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

  "submit .new-weight": (event) ->
      # Prevent default browser form submit
      event.preventDefault();
 
      # Get value from form element
      text = event.target.weightInput.value;
 
      console.log(text);
      Session.setPersistent('weight', text);

  "submit .new-name": (event) ->
      # Prevent default browser form submit
      event.preventDefault();
 
      # Get value from form element
      text = event.target.nameInput.value;
 
      console.log(text);
      Session.setPersistent('firstname', text);


    
})
