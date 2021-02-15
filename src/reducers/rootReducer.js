import {combineReducers} from 'redux'
import {fetchReducer} from './fetchReducer'
import {counterReducer} from './counterReducer'

export const rootReducer = combineReducers({
  fetchQuiz: fetchReducer,
  counterQuiz: counterReducer,
  // iterateQuiz: iteratedReducer
})