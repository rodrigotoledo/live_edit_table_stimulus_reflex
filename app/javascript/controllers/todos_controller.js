import ApplicationController from './application_controller'
import StimulusReflex from 'stimulus_reflex';

export default class extends ApplicationController {
  connect () {
    super.connect()
    StimulusReflex.register(this);
  }
  
  destroy(event) {
    if (confirm('Tem certeza que deseja excluir este item?')) {
      this.stimulate('TodoReflex#destroy', event.target.dataset.id);
    }
  }
}
