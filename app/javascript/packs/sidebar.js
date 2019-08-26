const dismiss = document.getElementById('dismiss');
const overlay = document.querySelector('.overlay');
const sidebar = document.getElementById('sidebar');

dismiss.addEventListener('click', () => {
  sidebar.classList.remove('active');
  overlay.classList.remove('active');
})

overlay.addEventListener('click', () => {
  sidebar.classList.remove('active');
  overlay.classList.remove('active');
})

sidebarCollapse.addEventListener('click', () => {
  const sidebarCollapse = document.getElementById('sidebarCollapse');
  // const collapseIn = document.querySelector('.collapse.in');
  // const link = document.querySelector('a[aria-expanded=true]');

  sidebar.classList.add('active');
  overlay.classList.add('active');
  // collapseIn.classList.toggle('in');

  // link.setAttribute('aria-expanded', 'false');
})
