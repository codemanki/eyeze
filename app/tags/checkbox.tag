<checkbox>
  <input type="checkbox" id="{opts.name}" onchange={opts.onchangehandler} checked={opts.ischecked && 'checked'}>
  <label for="{opts.name}">
    <span class="check"></span>
    <span class="labelText">{opts.text}</spa>
  </label>
  <style scoped>
    :scope input[type="checkbox"] {
      display: none;
    }
    :scope input[type="checkbox"] + label {
      display: inline-block;
      cursor: pointer;
    }

    :scope input[type="checkbox"] + label:hover .check {
      opacity: .4;
      transition-property: opacity;
      transition-duration: 0.2s;
    }

    :scope input[type="checkbox"] + label .check {
      position: relative;
      top: 2px;
      display: inline-block;
      width: 16px;
      height: 16px;
      background: url('assets/checkbox_off.png') 0 center no-repeat;
      opacity: 1;
      transition-property: opacity;
      transition-duration: 0.6s;
    }

    :scope input[type="checkbox"]:checked + label .check {
      -webkit-animation: checkboxOn 0.1s steps(27) 1;
      background: url('assets/checkbox_on.png') 0 center no-repeat;
    }

    :scope label .labelText {
      font-size: 16px;
    }

    @-webkit-keyframes checkboxOn {
      0% {
        background: url('assets/check.png') 0 0 no-repeat;
      }
      100% {
        background: url('assets/check.png') 0 -432px no-repeat;
      }
    }
  </style>
</checkbox>
