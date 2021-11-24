import Hammer from "hammerjs"

let profiles = document.querySelectorAll('.profile');

const maxAngle = -40;
const smooth = 0.4;
const threshold = 25;
const thresholdMatch = 150;
profiles.forEach(setupDragAndDrop);

function setupDragAndDrop(profile) {
  const hammertime = new Hammer(profile);

  hammertime.on('pan', function (e) {
    profile.classList.remove('profile--back');
    let posX = e.deltaX;
    let posY = Math.max(0, Math.abs(posX * smooth) - 42);
    let angle = Math.min(Math.abs(e.deltaX * smooth / 100), 1) * maxAngle;
    if (e.deltaX < 0) {
      angle *= -1;
    }

    profile.style.transform = `translateX(${posX}px) translateY(${posY}px) rotate(${angle}deg)`;
    profile.classList.remove('profile--matching');
    profile.classList.remove('profile--nexting');
    if (posX > thresholdMatch) {
      profile.classList.add('profile--matching');
    } else if (posX < -thresholdMatch) {
      profile.classList.add('profile--nexting');
    }

    if (e.isFinal) {
      profile.style.transform = ``;
      if (posX > thresholdMatch) {
        profile.classList.add('profile--match');
      } else if (posX < -thresholdMatch) {
        profile.classList.add('profile--next');
      } else {
        profile.classList.add('profile--back');
      }
    }
  });
}
