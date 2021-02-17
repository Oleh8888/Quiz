[1mdiff --git a/package-lock.json b/package-lock.json[m
[1mindex e71ef91..cb162d6 100644[m
[1m--- a/package-lock.json[m
[1m+++ b/package-lock.json[m
[36m@@ -4009,6 +4009,11 @@[m
         }[m
       }[m
     },[m
[32m+[m[32m    "classnames": {[m
[32m+[m[32m      "version": "2.2.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/classnames/-/classnames-2.2.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-JR/iSQOSt+LQIWwrwEzJ9uk0xfN3mTVYMwt1Ir5mUcSN6pU+V4zQFFaJsclJbPuAUQH+yfWef6tm7l1quW3C8Q=="[m
[32m+[m[32m    },[m
     "clean-css": {[m
       "version": "4.2.3",[m
       "resolved": "https://registry.npmjs.org/clean-css/-/clean-css-4.2.3.tgz",[m
[1mdiff --git a/package.json b/package.json[m
[1mindex 13cc11e..8c9200f 100644[m
[1m--- a/package.json[m
[1m+++ b/package.json[m
[36m@@ -1,5 +1,5 @@[m
 {[m
[31m-  "homepage": "http://https://oleh8888.github.io/Quiz",[m
[32m+[m[32m  "homepage": "https://oleh8888.github.io/Quiz",[m
   "name": "quiz",[m
   "version": "0.1.0",[m
   "private": true,[m
[36m@@ -7,6 +7,7 @@[m
     "@testing-library/jest-dom": "^5.11.9",[m
     "@testing-library/react": "^11.2.5",[m
     "@testing-library/user-event": "^12.6.3",[m
[32m+[m[32m    "classnames": "^2.2.6",[m
     "react": "^17.0.1",[m
     "react-dom": "^17.0.1",[m
     "react-flexbox": "^3.1.4",[m
[1mdiff --git a/src/App.css b/src/App.css[m
[1mindex e8ccacf..6d25be1 100644[m
[1m--- a/src/App.css[m
[1m+++ b/src/App.css[m
[36m@@ -59,4 +59,11 @@[m
   flex-direction: column;[m
   justify-content: center;[m
   align-items: center;[m
[31m-}[m
\ No newline at end of file[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m.quiz-answers-blocks {[m
[32m+[m[32m  display: flex;[m
[32m+[m[32m  flex-direction: row-reverse;[m
[32m+[m[32m  justify-content: center;[m
[32m+[m[32m  align-items: center;[m
[32m+[m[32m}[m
[1mdiff --git a/src/App.js b/src/App.js[m
[1mindex b49c0ef..2c427dd 100644[m
[1m--- a/src/App.js[m
[1m+++ b/src/App.js[m
[36m@@ -13,10 +13,10 @@[m [mimport {Correct} from "./components/Correct/correct";[m
 [m
 [m
 function App() {[m
[31m-  const dispatch = useDispatch();[m
[32m+[m[32m  const dispatch= useDispatch();[m
   const quiz = useSelector(state => state.fetchQuiz.fetchedPosts);[m
   const counter = useSelector(state => state.counterQuiz)[m
[31m-  const [color, setColor] = useState("")[m
[32m+[m[32m  const [color, setColor] = useState(" ")[m
   const [finalCorrect, setFinalCorrect] = useState();[m
 [m
   const mark = () => {[m
[36m@@ -38,11 +38,11 @@[m [mfunction App() {[m
         </div>[m
       </header>[m
       {quiz.map( (q,idx) => ([m
[31m-        <div key={q.id} className="quiz-blocks">[m
[31m-         <h5 className="questions" key={q.id}>{q.question}</h5>[m
[31m-          <div className="quiz-blocks">[m
[31m-            <Answers quiz={quiz[idx]} color={color}/>[m
[31m-            <Correct quiz={quiz[idx]} setColor={setColor} color={color}/>[m
[32m+[m[32m        <div  className="quiz-blocks" key={q.id}>[m
[32m+[m[32m         <h5 className="questions" >{q.question}</h5>[m
[32m+[m[32m          <div className="quiz-answers-blocks" >[m
[32m+[m[32m              <Answers quiz={quiz[idx]} color={color} id={q.id}/>[m
[32m+[m[32m              <Correct quiz={quiz[idx]} setColor={setColor} color={color}/>[m
           </div>[m
          </div>[m
       ))}[m
[1mdiff --git a/src/components/Answers/answers.css b/src/components/Answers/answers.css[m
[1mindex 9f72aaf..e69de29 100644[m
[1m--- a/src/components/Answers/answers.css[m
[1m+++ b/src/components/Answers/answers.css[m
[36m@@ -1,71 +0,0 @@[m
[31m-.container {[m
[31m-    display: block;[m
[31m-    position: relative;[m
[31m-    padding-left: 35px;[m
[31m-    margin-bottom: 12px;[m
[31m-    cursor: pointer;[m
[31m-    font-size: 22px;[m
[31m-    -webkit-user-select: none;[m
[31m-    -moz-user-select: none;[m
[31m-    -ms-user-select: none;[m
[31m-  [m
[31m-  }[m
[31m-  [m
[31m-  .container input {[m
[31m-    position: absolute;[m
[31m-    opacity: 0;[m
[31m-    cursor: pointer;[m
[31m-    height: 0;[m
[31m-    width: 0;[m
[31m-  }[m
[31m-  [m
[31m-  .checkmark {[m
[31m-    position: absolute;[m
[31m-    top: 0;[m
[31m-    left: 0;[m
[31m-    height: 25px;[m
[31m-    width: 25px;[m
[31m-    background-color: #eee;[m
[31m-  }[m
[31m-  [m
[31m-  .container:hover input ~ .checkmark {[m
[31m-    background-color: #ccc;[m
[31m-  }[m
[31m-  [m
[31m-  /* When the checkbox is checked, add a blue background */[m
[31m-.container input:checked ~ .checkmark {[m
[31m-    background-color: #2196F3;[m
[31m-  }[m
[31m-  [m
[31m-  /* Create the checkmark/indicator (hidden when not checked) */[m
[31m-  .checkmark:after {[m
[31m-    content: "";[m
[31m-    position: absolute;[m
[31m-    display: none;[m
[31m-  }[m
[31m-  [m
[31m-  /* Show the checkmark when checked */[m
[31m-  .container input:checked ~ .checkmark:after {[m
[31m-    display: block;[m
[31m-  }[m
[31m-  [m
[31m-  /* Style the checkmark/indicator */[m
[31m-  .container .checkmark:after {[m
[31m-    left: 9px;[m
[31m-    top: 5px;[m
[31m-    width: 5px;[m
[31m-    height: 10px;[m
[31m-    border: solid white;[m
[31m-    border-width: 0 3px 3px 0;[m
[31m-    -webkit-transform: rotate(45deg);[m
[31m-    -ms-transform: rotate(45deg);[m
[31m-    transform: rotate(45deg);[m
[31m-  }[m
[31m-  input[type=checkbox]{[m
[31m-    color: #ccc;[m
[31m-    font-style: italic;[m
[31m-  } [m
[31m-  input[type=checkbox]:checked {[m
[31m-    color: #f00;[m
[31m-    font-style: normal;[m
[31m-  } [m
\ No newline at end of file[m
[1mdiff --git a/src/components/Answers/answers.js b/src/components/Answers/answers.js[m
[1mindex b80c1a3..27f5c9e 100644[m
[1m--- a/src/components/Answers/answers.js[m
[1m+++ b/src/components/Answers/answers.js[m
[36m@@ -1,22 +1,25 @@[m
 import React from "react";[m
 import Flexbox from "react-flexbox";[m
[31m-import {useState } from 'react';[m
[32m+[m[32mimport { useDispatch, useSelector } from "react-redux";[m
[32m+[m[32mimport { useState,useEffect} from "react";[m
[32m+[m
 import * as S from './styles';[m
 import './answers.css';[m
 import {Correct} from "../Correct/correct"[m
 [m
[31m-export const Answers = ({quiz,color}) => {[m
[31m-[m
[32m+[m[32mexport const Answers = ({quiz,color,id,idxAnwser,setColor,idxCorrect}) => {[m[41m  [m
[32m+[m[32m    const [selected, setSelected] = useState(" ");[m
[32m+[m[32m    const [numOfAnswer, setNumOfAnswer] = useState(1);[m[41m  [m
 [m
 return ([m
     <S.AnswersBLock>    [m
[31m-    {Object.keys(quiz.answers).map((ans, idx) => {[m
[32m+[m[32m    {Object.keys(quiz.answers).map((ans, idxAnwswer) => {[m
         let finalAnswer = quiz.answers[ans][m
             if (finalAnswer!==null) {  [m
        return ([m
[31m-               <ul key={idx}>[m
[31m-                   <S.Li style={{backgroundColor: color}}>[m
[31m-                        <Flexbox flexDirection="row" justifyContent="flex-start">[m
[32m+[m[32m               <ul key={idxAnwswer}>[m
[32m+[m[32m                   <S.Li style={{backgroundColor: color}} >[m
[32m+[m[32m                        <Flexbox  flexdirection="row" justifycontent="flex-start">[m
                             {finalAnswer}[m
                         </Flexbox>[m
                     </S.Li>[m
[1mdiff --git a/src/components/Correct/correct.js b/src/components/Correct/correct.js[m
[1mindex 923614f..d1be573 100644[m
[1m--- a/src/components/Correct/correct.js[m
[1m+++ b/src/components/Correct/correct.js[m
[36m@@ -1,37 +1,48 @@[m
[31m-import React from "react";[m
[32m+[m[32mimport React, {useState} from "react";[m
 import { decrement, increment } from "../../actions/counterActions"[m
 import { useDispatch, useSelector } from "react-redux";[m
[32m+[m[32mimport classNames from 'classnames';[m
[32m+[m[32mimport './correct.css'[m
 [m
[31m-export const Correct = ({quiz,color, setColor}) => {[m
[32m+[m[32mexport const Correct = ({quiz,color, setColor,}) => {[m
[32m+[m[32m    const [fault, setFault] = useState(null);[m
     const dispatch = useDispatch();[m
[31m-[m
[31m-    const isCorrect = (event,correct) => {[m
[31m-        if (correct==="true"){[m
[31m-            event.target.color = setColor("green");[m
[31m-            dispatch(increment())[m
[31m-            console.log()[m
[32m+[m[32m    const checkMark = classNames('checkmark', {'correct': fault===true, 'uncorrect': fault===false})[m
     [m
[31m-        }[m
[31m-        else if (correct==="false") {[m
[31m-            event.target.color =setColor("red");[m
[31m-          dispatch(decrement())[m
[31m-          console.log()[m
[32m+[m[32m    const isCorrect = () => {[m
[32m+[m[32m        dispatch(increment())[m
[32m+[m[32m        console.log(checkMark)[m
[32m+[m[32m        setFault(true)[m
[32m+[m[32m    }[m
[32m+[m
[32m+[m[32m   const isUnCorrect = () => {[m
[32m+[m[32m     dispatch(decrement())[m
[32m+[m[32m     setFault(false)[m
[32m+[m[32m     console.log(checkMark)[m
[32m+[m[32m   }[m
[32m+[m
[32m+[m[32m    const check = (event,correct) => {[m
[32m+[m[32m        if(correct==="true"){[m
[32m+[m[32m            isCorrect();[m
[32m+[m[32m        } else if (correct==="false"){[m
[32m+[m[32m            isUnCorrect();[m
         } else {[m
[31m-            alert("noth")[m
[32m+[m[32m            return null;[m
         }[m
     }[m
[32m+[m[41m    [m
 [m
     return([m
[31m-        <>[m
[31m-        {Object.keys(quiz.correct_answers).map((cor) => {[m
[32m+[m[32m        <div className="checkboxes">[m
[32m+[m[32m        {Object.keys(quiz.correct_answers).map((cor,idxCorrect) => {[m
             let correct = quiz.correct_answers[cor];[m
             return ([m
[31m-                 <label class="container"  >{correct}[m
[31m-                     <input type="checkbox" style={{backgroundColor: color}} />[m
[31m-                     <span class="checkmark" onClick={(event) => isCorrect(event,correct)}></span>[m
[32m+[m[32m                 <label className="container" key={idxCorrect} >{correct}[m
[32m+[m[32m                     <input type="checkbox" onClick={event => check(event,correct)}/>[m
[32m+[m[32m                     <span className={checkMark} style={{color: color}} ></span>[m
                  </label>[m
                  );[m
             })}[m
[31m-         </>[m
[32m+[m[32m         </div>[m
     );[m
 }[m
\ No newline at end of file[m
