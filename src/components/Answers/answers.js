import React from "react";
import Flexbox from "react-flexbox";
import {useState } from 'react';
import * as S from './styles';
import './answers.css';
import {Correct} from "../Correct/correct"

export const Answers = ({quiz,color}) => {


return (
    <S.AnswersBLock>    
    {Object.keys(quiz.answers).map((ans, idx) => {
        let finalAnswer = quiz.answers[ans]
            if (finalAnswer!==null) {  
       return (
               <ul key={idx}>
                   <S.Li style={{backgroundColor: color}}>
                        <Flexbox flexDirection="row" justifyContent="flex-start">
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
        