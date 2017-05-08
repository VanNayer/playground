import {Observable} from 'rxjs'

// dom
const startButton = document.querySelector('#start')
const stopButton = document.querySelector('#stop')
const resetButton = document.querySelector('#reset')
const halfButton = document.querySelector('#half')
const quarterButton = document.querySelector('#quarter')
const input =  document.querySelector('#input')
const score = document.querySelector('#score')

// dom events
const start$ = Observable.fromEvent(startButton, 'click')
const stop$ = Observable.fromEvent(stopButton, 'click')
const reset$ = Observable.fromEvent(resetButton, 'click')
const half$ = Observable.fromEvent(halfButton, 'click')
const quarter$ = Observable.fromEvent(quarterButton, 'click')

// TIMER
const initialData = {count: 0}

const reset = () => initialData
const inc = ({count}) => ({count: count + 1})

const starters$ = Observable
  .merge(start$.mapTo(1000), half$.mapTo(500), quarter$.mapTo(250))
  .share()

const intervalActions = time => Observable.merge(
    Observable.interval(time).takeUntil(stop$).mapTo(inc),
    reset$.mapTo(reset)
)

const timer$ = starters$.switchMap(intervalActions)
  .startWith(initialData)
  .scan((acc, fun) => fun(acc))

// INPUT
const input$ = Observable.fromEvent(input, 'input')
  .map(event => event.target.value)

const gameInProgress$ = timer$
  .takeWhile(({count}) => count <= 3)
  .withLatestFrom(
    input$,
    ({count}, input) => ({count: count, text: input})
  ).share()

gameInProgress$
  .repeat()
  .subscribe(() => input.value = '')

starters$.subscribe(() => {
  score.innerHTML = '',
  input.value = ''
  input.focus()
})


gameInProgress$
  .filter(({count, text}) => count === parseInt(text))
  .reduce((acc, curr) => acc + 1, 0)
  .repeat()
  .subscribe(
    x => score.innerHTML = `${x}`,
    err => console.log(err),
    () => console.log(`My stream is over!`)
  )
