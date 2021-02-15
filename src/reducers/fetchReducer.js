import {FETCH_POSTS} from '../actions/fetchAction';

const initialState = {
  fetchedPosts: [],
  iteratedAnswers: []
}

export const fetchReducer = (state = initialState, action) => {
  switch (action.type) {
    case FETCH_POSTS:
      return { ...state, fetchedPosts: action.payload }
    default: return state
  }
   
}


