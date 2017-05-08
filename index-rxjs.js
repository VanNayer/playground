import {Observable} from 'rxjs'

const foo = Observable.create(obs => {
  var i = 0
  setInterval(() => obs.next(i++), 500)
})

foo.subscribe(x => console.log(x))
