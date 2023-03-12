const jwt =  require('jsonwebtoken');
const { JWT_KEY } = require('../config');

module.exports =  {
  verifyToken: (req, res, next) => {
    const authHeader = req.headers.authorization;
    const token = authHeader && authHeader.split(' ')[1];
    if (token == null) {
      res.status(403).json({ msg: 'Auth Error' });
    } else {
      jwt.verify(token, JWT_KEY, (err, user) => {
        if (err) {
          res.status(404).json({ msg: 'Token Error' });
        } else {
          req.user = user;
          next();
        }
      });
    }
  },
}