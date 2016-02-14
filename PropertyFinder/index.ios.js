var React=require('react-native')
var SearchPage = require('./SearchPage');
//single style sheet which will apply the "HelloWorld" text
/*
  var styles = React.StyleSheet.create({
  text:{
    color: 'black',
    backgroundColor: 'white',
    fontSize: 30,
    margin: 80
  }
})
*/

//navigation style sheet
var styles = React.StyleSheet.create({
  text:{
    color:'black',
    backgroundColor:'white',
    fontSize:30,
    margin:80
  },
  container:{
    flex: 1
  }
})
//Application Itself
//Current application is quite simple so only requires the render() method
class HelloWorld extends React.Component{
  render(){
    //return React.createElement(React.Text, {style:styles.text}, "Hello World!");
    return <React.Text style = {styles.text}>Hello World (Again)</React.Text>
  }
}

//Adding navigation 1) changing root component of the app
class PropertyFinderApp extends React.Component{
  render(){
  return(
    <React.NavigatorIOS  //Constructs a navigation controller
      style = {styles.container} //Applying a style
      initialRoute={{      //Pages are mapped into URLs
        title: 'Property Finder',
        component: SearchPage,
      }}/>

    );
  }
}
React.AppRegistry.registerComponent('PropertyFinder', function() { return PropertyFinderApp });