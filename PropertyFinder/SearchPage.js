'use strict'

var React = require('react-native');
var SearchResults = require('./SearchResults');


/*destructuring assignment, which lets you extract multiple object 
properties and assign them to variables using a single statement, 
as a result, the rest of your code can drop the React prefix*/

var{
	StyleSheet,
	Text,
	TextInput,
	View,
	TouchableHighlight,
	ActivityIndicatorIOS,
	Image,
	Component
}=React;

var styles = StyleSheet.create({
	description:{
		marginBottom: 20,
		fontSize: 18,
		textAlign: 'center',
		color: '#656565',
	},
	container:{
		padding: 30,
		marginTop: 65,
		alignItems: 'center'
	},
	flowRight: {
	  flexDirection: 'row',
	  alignItems: 'center',
	  alignSelf: 'stretch'
	},
	buttonText: {
	  fontSize: 18,
	  color: 'white',
	  alignSelf: 'center'
	},
	button: {
	  height: 36,
	  flex: 1,
	  flexDirection: 'row',
	  backgroundColor: '#48BBEC',
	  borderColor: '#48BBEC',
	  borderWidth: 1,
	  borderRadius: 8,
	  marginBottom: 10,
	  alignSelf: 'stretch',
	  justifyContent: 'center'
	},
	searchInput: {
	  height: 36,
	  padding: 4,
	  marginRight: 5,
	  flex: 4,
	  fontSize: 18,
	  borderWidth: 1,
	  borderColor: '#48BBEC',
	  borderRadius: 8,
	  color: '#48BBEC'
	},
	image:{
		width:217,
		height:138
	}

});

//urlSearch . Doesn't depend on SearchPage
//as a free function instead of a method in SearchPage class
//t first creates the query string based on the parameters in data. Following this, it transforms
//the data into the required string format, name=value pairs separated by ampersands.
function urlForQueryAndPage(key, value, pageNumber) {
  var data = {
      country: 'uk',
      pretty: '1',
      encoding: 'json',
      listing_type: 'buy',
      action: 'search_listings',
      page: pageNumber
  };
  data[key] = value;
 
  var querystring = Object.keys(data)
    .map(key => key + '=' + encodeURIComponent(data[key]))
    .join('&');
 
  return 'http://api.nestoria.co.uk/api?' + querystring;
};

//Add the component itself
class SearchPage extends Component{
	constructor(props) {
	  super(props);
	  this.state = {
		  searchString: 'london',
		  isLoading: false,
		  message: ''
		};
	}

	render(){
		//Adding logic for the search query
		var spinner=this.state.isLoading ?
		(<ActivityIndicatorIOS hidden = 'true' size='large'/>):(<View/>);
		console.log('SearchPage.render');
		return(<View style = {styles.container}>
			<Text style = {styles.description}>
			Search for houses to buy!
			</Text>
			<Text stle = {styles.description}>
			Search by place-name, postcode or search near your location.
			</Text>

			<View style={styles.flowRight}>
			  <TextInput
			    style={styles.searchInput}
			    value={this.state.searchString}
			    onChange={this.onSearchTextChanged.bind(this)}
			    placeholder='Search via name or postcode'/>
			  <TouchableHighlight style={styles.button}
			 	  onPress={this.onSearchPressed.bind(this)}
			      underlayColor='#99d9f4'>
			    <Text style={styles.buttonText}>Go</Text>
			  </TouchableHighlight>
			</View>
			<TouchableHighlight style={styles.button}
				onPress = {this.onLocationPressed.bind(this)}
			    underlayColor='#99d9f4'>
			  <Text style={styles.buttonText}>Location</Text>
			</TouchableHighlight>
			<Image source = {require('image!house')} style={styles.image}/>
			<Text style={styles.description}>{this.state.message}</Text>
			{spinner}
			</View>

		);
	}

	//method to find the nearby location
	onLocationPressed() {
	  navigator.geolocation.getCurrentPosition(
	    location => {
	      var search = location.coords.latitude + ',' + location.coords.longitude;
	      this.setState({ searchString: search });
	      var query = urlForQueryAndPage('centre_point', search, 1);
	      this._executeQuery(query);
	    },
	    error => {
	      this.setState({
	        message: 'There was a problem with obtaining your location: ' + error
	      });
	    });
	}

	onSearchTextChanged(event) {
	  console.log('onSearchTextChanged');
	  this.setState({ searchString: event.nativeEvent.text });
	  console.log(this.state.searchString);
	}

	//Added code to the executeQuerey
	_executeQuery(query){
		console.log(query);
		this.setState({isLoading:true});
		fetch(query)
		.then(response => response.json())
		.then(json => this._handleResponse(json.response))
		.catch(error => 
		 this.setState({
		  isLoading: false,
		  message: 'Something bad happened ' + error
		}));
	}

	onSearchPressed(){
		var query = urlForQueryAndPage('place_name', this.state.searchString,1);
		this._executeQuery(query);
	}

	_handleResponse(response) {
	  this.setState({ isLoading: false , message: '' });
	  if (response.application_response_code.substr(0, 1) === '1') {
	    //console.log('Properties found: ' + response.listings.length);
	  	//navigates to the searchresults component and passes in the listings from the API request 
	  	//push makes sure it goes into the navigation stack
	  	this.props.navigator.push(
	  	{
	  		title:'Results',
	  		component: SearchResults,
	  		passProps: {listings:response.listings}
	  	})
	  } else {
	    this.setState({ message: 'Location not recognized; please try again.'});
	  }
	}


}




module.exports = SearchPage;
