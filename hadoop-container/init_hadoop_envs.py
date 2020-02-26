import argparse
import os


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--envs', nargs='+')
    parser.add_argument('--hadoop_env_path', type=str)

    return vars(parser.parse_args())


def main():
    print('Initializing Hadoop environment....')

    args = parse_args()
    print('Arguments:')
    print(args)

    try:
        with open(args['hadoop_env_path'], 'w+') as f:
            for env_name in args['envs']:
                env_value = os.getenv(env_name)
                f.write('export {}={}\n'.format(env_name, env_value))
        print('Initializing Hadoop environment finished successfully.')
    except Exception as error:
        print('Something went wrong while initializing Hadoop environment.')
        print(error)


if __name__ == '__main__':
    main()
