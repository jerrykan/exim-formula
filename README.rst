====
Exim
====

Salt formula to install and configure the Exim mail transfer agent on Debian
hosts.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``exim``
--------

Installs the exim4 package and starts the service.

``exim.aliases``
---------------
Manages the hosts mail aliases

``exim.config``
---------------
Manages the Exim configuration files.

``exim.mailname``
---------------
Manages the /etc/mailname value used by Debian hosts.
