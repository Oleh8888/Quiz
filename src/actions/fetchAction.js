export const FETCH_POSTS = 'POST/FETCH_POSTS'
export const ITERATE_ANSWERS = 'POST/ITERATE_ANSWERS'

const url = 'https://quizapi.io/api/v1/questions'
  const apiKey='JvAi9cMLcqB3etPH9J91pECRIsrgeuvZW7qbwrda'
  const limit = 5;
  const category= 'Code';
  const endpoint = `${url}?apiKey=${apiKey}&limit=${limit}&category=${category}`;

export function loadQuiz() {
    return async dispatch => {
        const response = await fetch(endpoint)
        const json = await response.json()
        dispatch({ type: FETCH_POSTS, payload: json })
  }
}



// export function iterateAnswers() {
//     return async dispatch => {
//         quiz.map( (qui,idx) => {
//           const output = await quiz[qui]
//         }
//         dispatch({ type: ITERATE_ANSWERS, payload:  })
//   }
// }