import React from 'react';
import { requireNativeComponent } from 'react-native';


class StarRatingView extends React.Component {

   constructor(props: {visible: boolean}) {
    super(props);
    this.state = { visible: false };
  }

  render() {
    return <RCTStar {...this.props}/>;
  }
}

StarRatingView.propTypes = {
    visible : React.PropTypes.bool,
};

//AppRegistry.registerComponent('DJCStarRating', () => StarRatingView);
var RCTStar = requireNativeComponent('DJCStarRating', StarRatingView);
module.exports = StarRatingView;


