import '@testing-library/jest-dom';
import Adapter from '@wojtekmaj/enzyme-adapter-react-17';
import Enzyme, { render } from 'enzyme';
import React from 'react';
import App from '../renderer/App';

Enzyme.configure({ adapter: new Adapter() });

describe('App', () => {
  it('should render', () => {
    expect(render(<App />)).toBeTruthy();
  });
});
