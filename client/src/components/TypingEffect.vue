<script setup lang="ts">
import { ref } from 'vue'

const props = defineProps<{
  phrases: Array<string>
}>()

const currentPhraseIndex = ref(0);
const currentCharacterIndex = ref(0);
const currentPhrase = ref("");
const isDeleting = ref(false);

const spedUp = 50;
const normalSpeed = 200;
var timeout = 0

function loop() {
  const currentPhraseText = props.phrases[currentPhraseIndex.value];
  var isWaiting = false

  if (!isDeleting.value) {
    currentPhrase.value += currentPhraseText[currentCharacterIndex.value];
    currentCharacterIndex.value++;
  } else {
    currentPhrase.value = currentPhrase.value.slice(0, -1);
    currentCharacterIndex.value--;
  }

  if (currentCharacterIndex.value === currentPhraseText.length) {
    isWaiting = true
    isDeleting.value = true;
  }

  if (currentCharacterIndex.value === 0) {
    currentPhrase.value = "";
    isDeleting.value = false;
    currentPhraseIndex.value++;
    if (currentPhraseIndex.value === props.phrases.length) {
      currentPhraseIndex.value = 0;
    }
  }

  if (isDeleting.value && isWaiting) {
    timeout = 2000
  } else if (isDeleting.value && !isWaiting) {
    timeout = spedUp
  } else {
    timeout = normalSpeed
  }
  setTimeout(loop, timeout);
}

loop();

</script>

<template>
  <span class="container">
    <h1 style="margin-top: 0; padding-top: 0" >
      Hi, 
      <span class="typed-text"> {{ currentPhrase }}</span>
      <span class="blinking-cursor">|</span>
    </h1>
  </span>
</template>

<style lang="scss" scoped>

.container {
  width: 100%;
  height: fit-content;
  display: flex;
  margin-left: 2rem;
  justify-content: left;
  align-items: start;
}

h1 {
  font-size: 2rem;
  font-weight: normal;
  span.typed-text {
    color: var(--primary-color);
  }
}

.blinking-cursor {
  font-size: 2rem;
  color: #2c3e50;
  -webkit-animation: 1s blink step-end infinite;
  -moz-animation: 1s blink step-end infinite;
  -ms-animation: 1s blink step-end infinite;
  -o-animation: 1s blink step-end infinite;
  animation: 1s blink step-end infinite;
}
@keyframes blink {
  from,
  to {
    color: transparent;
  }
  50% {
    color: #2c3e50;
  }
}
@-moz-keyframes blink {
  from,
  to {
    color: transparent;
  }
  50% {
    color: #2c3e50;
  }
}
@-webkit-keyframes blink {
  from,
  to {
    color: transparent;
  }
  50% {
    color: #2c3e50;
  }
}
@-ms-keyframes blink {
  from,
  to {
    color: transparent;
  }
  50% {
    color: #2c3e50;
  }
}
@-o-keyframes blink {
  from,
  to {
    color: transparent;
  }
  50% {
    color: #2c3e50;
  }
}

</style>