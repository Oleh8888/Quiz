import {ITERATE_ANSWERS} from '../actions/fetchAction';

const initialState = {
  iteratedAnswers: []
}

export const iteratedReducer = (state = initialState, action) => {
    switch (action.type) {
        case ITERATE_ANSWERS:
                return {...state, iteratedAnswers: action.payload }
        default: return state
    }
   
}