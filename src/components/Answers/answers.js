import React from "react";
import Flexbox from "react-flexbox";
import { useDispatch, useSelector } from "react-redux";
import { useState,useEffect} from "react";

import * as S from './styles';
import './answers.css';
import {Correct} from "../Correct/correct"

export const Answers = ({quiz,color,id,idxAnwser,setColor,idxCorrect}) => {  
    const [selected, setSelected] = useState(" ");
    const [numOfAnswer, setNumOfAnswer] = useState(1);  

return (
    <S.AnswersBLock>    
    {Object.keys(quiz.answers).map((ans, idxAnwswer) => {
        let finalAnswer = quiz.answers[ans]
            if (finalAnswer!==null) {  
       return (
               <ul key={idxAnwswer}>
                   <S.Li style={{backgroundColor: color}} >
                        <Flexbox  flexdirection="row" justifycontent="flex-start">
                            {finalAnswer}
                        </Flexbox>
                    </S.Li>
               </ul>
            );
      }
    })}
    </S.AnswersBLock>
    );
}
        