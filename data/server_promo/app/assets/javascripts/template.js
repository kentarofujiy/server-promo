{
  const cache = {};
  class Template extends HTMLXElement {
    constructor() {
      super();
    }

    createdCallback() {
    }

    attachedCallback() {
      const name = this.getAttribute('name');
      if (name) {
        cache[name] = this;
      } else {
        console.warn('Template without name', this);
      }
    }
  }
  window.Template = document.registerElement('x-template', Template);
  window.Template.compile = function(name) {
    let template = cache[name];
    if (template) {
      benchmark.start(`Template compilation: ${name}`);
      template = ft(template.innerHTML);
      benchmark.stop(`Template compilation: ${name}`);
      return template;
    } else {
      console.error('Template named "%s" not found', name);
    }
  };
}
