import React from "react";
import { decrement, increment } from "../../actions/counterActions"
import { useDispatch, useSelector } from "react-redux";

export const Correct = ({quiz,color, setColor}) => {
    const dispatch = useDispatch();

    const isCorrect = (event,correct) => {
        if (correct==="true"){
            event.target.color = setColor("green");
            dispatch(increment())
            console.log()
    
        }
        else if (correct==="false") {
            event.target.color =setColor("red");
          dispatch(decrement())
          console.log()
        } else {
            alert("noth")
        }
    }

    return(
        <>
        {Object.keys(quiz.correct_answers).map((cor) => {
            let correct = quiz.correct_answers[cor];
            return (
                 <label class="container"  >{correct}
                     <input type="checkbox" style={{backgroundColor: color}} />
                     <span class="checkmark" onClick={(event) => isCorrect(event,correct)}></span>
                 </label>
                 );
            })}
         </>
    );
}