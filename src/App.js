import { useDispatch, useSelector } from "react-redux";
import './App.css';
import {loadQuiz}   from "./actions/fetchAction";
import Flexbox from "react-flexbox";
import {useState} from "react";

import {Answers} from "./components/Answers/answers";
import {Correct} from "./components/Correct/correct";






function App() {
  const dispatch = useDispatch();
  const quiz = useSelector(state => state.fetchQuiz.fetchedPosts);
  const counter = useSelector(state => state.counterQuiz)
  const [color, setColor] = useState("")
  const [finalCorrect, setFinalCorrect] = useState();

  const mark = () => {

  }
  return (
    <div className="App">
      <header className="header">
        <button
        className='LoadButton' 
        onClick={() => dispatch(loadQuiz())}
        > 
        Download quiz
        </button>
        <div className="title">Quiz
        </div>
        <div className="score">Score
          <span>{counter}</span>
        </div>
      </header>
      {quiz.map( (q,idx) => (
        <div key={q.id} className="quiz-blocks">
         <h5 className="questions" key={q.id}>{q.question}</h5>
          <div className="quiz-blocks">
            <Answers quiz={quiz[idx]} color={color}/>
            <Correct quiz={quiz[idx]} setColor={setColor} color={color}/>
          </div>
         </div>
      ))}
    </div>
  );
}

export default App;
