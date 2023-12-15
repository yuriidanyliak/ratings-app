// eslint-disable-next-line no-undef
module.exports = {
  rootDir: 'app/javascript',
  setupFilesAfterEnv: ['<rootDir>/jest.js'],
  collectCoverageFrom: ['<rootDir>/**/*'],
  modulePathIgnorePatterns: ["<rootDir>/coverage/"],
  coverageThreshold: {
    global: {
      statements: 20,
      branches: 20,
      functions: 20,
      lines: 20,
    },
  },
};
