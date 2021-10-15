import os
import tempfile

import pytest
from elpytest_server import create_app


@pytest.fixture
def client():
    db_fd, db_path = tempfile.mkstemp()
    app = create_app({'TESTING': True, 'DATABASE': db_path})

    with app.test_client() as client:
        yield client

    os.close(db_fd)
    os.unlink(db_path)


@pytest.fixture
def runner(app):
    """A test runner for the app's Click commands."""
    return app.test_cli_runner()


def test_empty_db(client):
    """Check index response."""

    resp = client.get('/')
    assert b'Hello, Boy!' == resp.data


def test_hello(client):
    response = client.get("/hello")
    assert response.data == b"Hello, World!"
