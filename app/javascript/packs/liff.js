const liffID = gon.LIFF_ID_key;

window.onload = function () {
  const getProfileButton = document.querySelector('#getProfile');

  liff
    .init({
      liffId: liffID,
    })
    .then(() => {
      if (!liff.isLoggedIn()) {
        liff.login();
      }
      console.log('liff');
    })
    .catch((err) => {
      console.log(err.code, err.message);
    });

  getProfileButton.addEventListener('click', () => {
    let idToken = liff.getIDToken();
    let body = `idToken${idToken}`;
    let request = new Request('/users', {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
        'X-CSRF-Token': token,
      },
      method: 'POST',
      body: body,
    });

    fetch(request)
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
      });
  });
};
