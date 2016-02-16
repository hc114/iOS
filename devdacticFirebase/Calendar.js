'use strict';

var React = require('react-native');
var Calendar = require('react-native-calendar');
var moment = require('moment');

var {
  AppRegistry,
  TouchableHighlight,
  StyleSheet,
  Text,
  View,
} = React;

var ToDo=require('./ToDo');
var customDayHeadings = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']

var CalendarExample = React.createClass({
  getInitialState: function() {
    return {
      selectedDate: moment().format()
    };
  },
  render: function() {
    return (
      <View style={styles.container}>
        <Calendar
          ref="calendar"
          eventDates={['2015-07-03', '2015-07-05', '2015-07-10', '2015-07-15', '2015-07-20', '2015-07-25', '2015-07-28', '2015-07-30']}
          scrollEnabled={true}
          showControls={true}
          dayHeadings={customDayHeadings}
          titleFormat={'MMMM YYYY'}
          prevButtonText={'Prev'}
          nextButtonText={'Next'}
          onDateSelect={(date) => this.setState({selectedDate: date})}
          onTouchPrev={() => console.log('Back TOUCH')}
          onTouchNext={() => console.log('Forward TOUCH')}
          //onSwipePrev={() => console.log('Back SWIPE')}
          onSwipeNext={() => console.log('Forward SWIPE')}/>
        <Text>Selected Date: {moment(this.state.selectedDate).format('MMMM DD YYYY')}</Text>  
        <TouchableHighlight onPress={this.onReminderPressed()} style={styles.button}>
            <Text style = {styles.buttonText}>Reminders</Text>
        </TouchableHighlight> 
           
        
      </View>
      
    );
  },
  onReminderPressed: function(){
    this.props.navigator.push({
        title: "Reminder",
        component: ToDo,
    });
  }
});



var styles = StyleSheet.create({
  container: {
    flex: 4,
    paddingTop: 20,
    backgroundColor: '#f7f7f7',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  button:{
    height: 36,
    backgroundColor: "#555555",
    borderColor: "#555555",
    borderWidth: 1,
    borderRadius: 8,
    marginTop: 10,
    justifyContent: "center"
  },
  buttonText:{
    fontSize: 18,
    color: "#ffffff",
    alignSelf: "center"
  },
});

module.exports=CalendarExample;