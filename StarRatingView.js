import React from 'react';
import { requireNativeComponent } from 'react-native';


class StarRatingView extends React.Component {
  render() {
    return <RCTStar/>;
  }
}

var RCTStar = requireNativeComponent('DJCStarRating', StarRatingView);

module.exports = StarRatingView;


