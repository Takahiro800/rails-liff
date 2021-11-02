const liffID = gon.LIFF_ID_key;

window.onload = function () {
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const getLoginButton = document.querySelector('#getProfile');

  liff
    .init({
      liffId: liffID,
    })
    .then(() => {
      if (!liff.isLoggedIn()) {
        liff.login();
      }
    })
    .then(() => {
      const idToken = liff.getIDToken();
      const body = `idToken=${idToken}`;
      const request = new Request('/users', {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
          'X-CSRF-Token': token,
        },
        method: 'POST',
        body: body,
      });

      fetch(request).then(() => {
        // const params = new URLSearchParams(window.location.search);
        // const schedule_token = params.get('token');
        const redirect_url = `/users/new`;
        window.location = redirect_url;
      });
    })
    .catch((err) => {
      console.log(err.code, err.message);
    });
};
