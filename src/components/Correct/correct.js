import {useState} from "react";
import { decrement, increment } from "../../actions/counterActions"
import { useDispatch, useSelector } from "react-redux";
import classNames from 'classnames';
import './correct.css'

export const Correct = ({quiz,color, setColor,}) => {
    // const containerId = classNames("container", "correct" ? "uncorrect": )
    const [fault, setFault] = useState(null);
    const dispatch = useDispatch();
    
    const isCorrect = () => {
        dispatch(increment())
        setColor("green")
    }

    const isUnCorrect = () => {
        dispatch(decrement())
        setColor("red")
   }

    const check = (event,correct) => {
        if(correct==="true"){
            isCorrect();
            console.log(correct)
        } else if (correct==="false"){
            isUnCorrect();
            console.log(correct)
        } else {
            return null;
        }
    }
    

    return(
        <div className="checkboxes">
        {Object.keys(quiz.correct_answers).map((cor,idxCorrect) => {
            let correct = quiz.correct_answers[cor];
            return (
                 <label className="container"  key={idxCorrect} style={{color: color}}>{correct}
                     <input type="checkbox" onClick={event => check(event,correct)}/>
                     <span className="checkmark"></span>
                 </label>
                 );
            })}
         </div>
    );
}