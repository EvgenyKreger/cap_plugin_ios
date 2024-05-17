
import { registerPlugin } from '@capacitor/core';

const mySpmPlugin = registerPlugin('MySpmPlugin')

document.addEventListener('DOMContentLoaded', function() {
  const centeredButton = document.getElementById('centeredButton');
  if (centeredButton) {
    centeredButton.addEventListener('click', handleClick);
  }
});

async function handleClick() {
  try {
    await mySpmPlugin.getModel().then(()=>  alert('It work'));
  } catch (err) {
    alert(err)
    console.log(err);
  }
 
}


